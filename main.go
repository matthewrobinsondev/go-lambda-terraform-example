package main

import (
	"github.com/aws/aws-lambda-go/lambda"
	"log"
)

func handler() error {
	log.Println("Golang Lambda executed via Eventbridge Cron")
	return nil
}

func main() {
	lambda.Start(handler)
}
