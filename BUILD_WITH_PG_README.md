Building Telegraf with TimescaleDB and PostgreSQL plugin

1. Check out the `postgres` branch
2. Run the tests for the postgres output plugin only, after running `docker-compose up`, (other plugins fail, not our fault)
3. Check out the `build-branch` branch
4. Rebase the `build-branch` on top of `postgres` (git checkout build-branch; git rebase postgres)
5. Copy `plugins/output/postgresql`, `Dockerfile` and `fake_build.sh` outside of the repo
6. Check out the latest stable tag of Telegraf
7. Create a branch called `telegraf-with-pg`
8. Copy the folder and files from step 5. back into the repo
9. Change the `cmd/telegraf/telegraf.go` 
   * remove line 64 (version string) from the var block
   * create a const version with e.g `const version = "1.10.4-with-pg"`
10. Change the `plugins/output/all/all.go` file to import our plugin. Just add `_ "github.com/influxdata/telegraf/plugins/outputs/postgresql"` somewhere in the imports (preferrably in maintaining the alphabetical order)
11. Make a commit with them to the current branch
12. Tag the current commit with $VERSION_NAME-with-pg e.g. `1.10.4-with-pg`
13. Run `fake_build.sh` and wait for the Linux and Windows versions to be build and put into `build/`
14. run `mkdir ./build/macos/` and `go build -o ./build/macos/telegraf ./cmd/telegraf/`
15. Do what you want with the ./build folder

