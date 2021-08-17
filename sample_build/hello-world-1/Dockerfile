# use base golang image from Docker hub
FROM golang:1.16 AS build
WORKDIR /hello-world

#install dependencies in go.sum and go.mod
COPY go.mo go.sum ./
RUN go mod download

# copy rest of the application source code 

COPY . ./

# compile the application to /app
# skafforld passes the debug-oriented compiler flags 

ARG  SKAFFOLD_GO_FLAGS 
RUN echo "Go gcflags="${SKAFFOLD_GO_GCLAGS}" -mod=readonly -v -o /app

# now create a separate deployment image 
FROM gcr.io/distroless/base 


# Definition of this variable is used by 'skaffold debug' to identify a golang binary.
# Default behavior - a failure prints a stack trace for the current goroutine.
# See https://golang.org/pkg/runtime/


ENV GOTRACEBACK=single 

# copy template and assests

WORKDIR /hello-world 
COPY --from=build /app ./app
COPY index.html index.html
COPY assets assets/

ENTRYPOINT ["./app"]

