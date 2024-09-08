package main

import (
	"github.com/xymeng16/ohos-go"
	"github.com/xymeng16/ohos-go/entry"
)

func MyHandler(env napi.Env, info napi.CallbackInfo) napi.Value {
	return nil
}

func init() {
	entry.Export("myHandler", MyHandler)
}

func main() {}
