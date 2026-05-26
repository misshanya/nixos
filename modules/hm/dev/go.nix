{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.my.home.dev.go;
in
{
  options.my.home.dev.go.enable = lib.mkEnableOption "Go dev tools";

  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      golangci-lint
      go-mockery
      go-task
      air
      protobuf
      protoc-gen-go
      protoc-gen-go-grpc
      buf
      goose
      sqlc
    ];
  };
}
