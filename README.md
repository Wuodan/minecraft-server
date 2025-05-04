# Instructions

## Clone repo
Clone the repo and switch to this branch with:
```
git clone https://github.com/Wuodan/minecraft-server.git
cd minecraft-server
git switch sons-minecraft-server
```

## Add JAR files for mods
Place the JAR files for mods in the `mod` folder.

## Start minecraft server
```
docker compose up -d
```

## View server logs
```
docker compose logs -f
```
Terminate log viewer with Ctrl-C.

## Backup running server
```
./scripts/backup.sh
```

## Stop minecraft server
```
docker compose down
```
