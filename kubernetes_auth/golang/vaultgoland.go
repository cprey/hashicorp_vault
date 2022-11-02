package main

import (
	"fmt"
	"os"

	"github.com/hashicorp/vault/api"
)

var token = os.Getenv("VAULT_TOKEN")
var vault_addr = os.Getenv("VAULT_ADDR")

func main() {
	config := &api.Config{
		Address: vault_addr,
	}
	client, err := api.NewClient(config)
	if err != nil {
		fmt.Println(err)
		return
	}
	client.SetToken(token)
	secret, err := client.Logical().Read("secret/data/beer")
	if err != nil {
		fmt.Println(err)
		return
	}
	m, ok := secret.Data["data"]
	if !ok {
		fmt.Printf("here: %T %#v\n", secret.Data["data"], secret.Data["data"])
		fmt.Println(m)
	}

	for x, y := range secret.Data {
		fmt.Println(x, y)
	}

}
