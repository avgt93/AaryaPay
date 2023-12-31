package profile

import (
	"context"
	"database/sql"
	"main/core"
	. "main/telemetry"
	. "main/utils"
	"net/http"

	"github.com/gin-gonic/gin"
	"github.com/google/uuid"
)

type ProfileData struct {
	Id         uuid.UUID     `json:"id,omitempty" db:"id"`
	FirstName  string        `json:"first_name,omitempty" db:"first_name" `
	PhotoUrl   *string       `json:"photo_url,omitempty" db:"photo_url"`
	MiddleName *string       `json:"middle_name,omitempty" db:"middle_name"`
	LastName   string        `json:"last_name,omitempty" db:"last_name"`
	DOB        UnixTimestamp `json:"dob,omitempty" db:"dob"`
	Email      string        `json:"email,omitempty" db:"email"`
}

type GetProfileController struct{}

func (GetProfileController) GetProfile(c *gin.Context) {
	user, err := core.GetActiveUser(c)
	l := Logger(c).Sugar()

	if err != nil {
		msg := "User not logged in!"
		Logger(c).Sugar().Errorw(msg,
			"error", err,
		)
		c.AbortWithStatusJSON(http.StatusUnauthorized, gin.H{"msg": msg})
		return
	}

	var profileDataReturn struct {
		Id         uuid.UUID     `json:"id,omitempty" db:"id"`
		FirstName  string        `json:"first_name,omitempty" db:"first_name" `
		PhotoUrl   *string       `json:"photo_url,omitempty" db:"photo_url"`
		MiddleName *string       `json:"middle_name,omitempty" db:"middle_name"`
		LastName   string        `json:"last_name,omitempty" db:"last_name"`
		DOB        UnixTimestamp `json:"dob,omitempty" db:"dob"`
		Email      string        `json:"email,omitempty" db:"email"`
	}

	var profileData = core.DB.QueryRow(context.Background(), "SELECT id, first_name, middle_name, last_name, photo_url, dob, email FROM Users WHERE id = $1", user)
	err = profileData.Scan(&profileDataReturn.Id, &profileDataReturn.FirstName, &profileDataReturn.MiddleName, &profileDataReturn.LastName, &profileDataReturn.PhotoUrl, &profileDataReturn.DOB, &profileDataReturn.Email)

	if err != nil {
		l.Errorw("Error getting user profile!",
			"error", err,
		)
		c.AbortWithStatusJSON(http.StatusInternalServerError, gin.H{"msg": "Unknown error occured!", "context": TraceIDFromContext(c)})
		return
	}

	c.JSON(http.StatusOK, gin.H{"msg": "success", "data": profileDataReturn})
}

func (GetProfileController) GetSpecificProfile(c *gin.Context) {
	_, err := core.GetActiveUser(c)
	l := Logger(c).Sugar()

	if err != nil {
		msg := "User not logged in!"
		Logger(c).Sugar().Errorw(msg,
			"error", err,
		)
		c.AbortWithStatusJSON(http.StatusUnauthorized, gin.H{"msg": msg})
		return
	}

	userId := c.Param("id")

	var profileDataReturn struct {
		Id         uuid.UUID     `json:"id,omitempty" db:"id"`
		FirstName  string        `json:"first_name,omitempty" db:"first_name" `
		PhotoUrl   *string       `json:"photo_url,omitempty" db:"photo_url"`
		MiddleName *string       `json:"middle_name,omitempty" db:"middle_name"`
		LastName   string        `json:"last_name,omitempty" db:"last_name"`
		DOB        UnixTimestamp `json:"dob,omitempty" db:"dob"`
		Email      string        `json:"email,omitempty" db:"email"`
	}

	userIdUUID, err := uuid.Parse(userId)

	if err != nil {
		msg := "No such profile exists!"

		l.Errorw(msg,
			"error", err,
			"id", userId,
		)

		c.AbortWithStatusJSON(http.StatusNotFound, gin.H{"msg": msg, "context": TraceIDFromContext(c)})
		return
	}

	var profileData = core.DB.QueryRow(context.Background(), "SELECT id, first_name, middle_name, last_name, photo_url, dob, email FROM Users WHERE id = $1", userIdUUID)
	err = profileData.Scan(&profileDataReturn.Id, &profileDataReturn.FirstName, &profileDataReturn.MiddleName, &profileDataReturn.LastName, &profileDataReturn.PhotoUrl, &profileDataReturn.DOB, &profileDataReturn.Email)

	if err == sql.ErrNoRows {
		msg := "No such profile exists!"

		l.Errorw(msg,
			"error", err,
			"id", userId,
		)

		c.AbortWithStatusJSON(http.StatusNotFound, gin.H{"msg": msg, "context": TraceIDFromContext(c)})
		return

	} else if err != nil {
		l.Errorw("Error getting user profile!",
			"error", err,
		)

		c.AbortWithStatusJSON(http.StatusInternalServerError, gin.H{"msg": "Unknown error occured!", "context": TraceIDFromContext(c)})
		return
	}

	c.JSON(http.StatusOK, gin.H{"msg": "success", "data": profileDataReturn})
}
