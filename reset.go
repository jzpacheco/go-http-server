package main

import (
	"log"
	"net/http"
)

func (cfg *apiConfig) handlerReset(w http.ResponseWriter, r *http.Request) {
	if cfg.platform != "DEV" {
		respondWithError(w, http.StatusForbidden, "You aren't in a safe environment!!!", nil)
	}
	usersDeleted, err := cfg.db.DeleteUsers(r.Context())
	if err != nil {
		respondWithError(w, http.StatusInternalServerError, "Error excluding users", err)
		return
	}
	log.Printf("%d excluded users", usersDeleted)
	cfg.fileserverHits.Store(0)
	w.WriteHeader(http.StatusOK)
	w.Write([]byte("Hits reset to 0"))
}
