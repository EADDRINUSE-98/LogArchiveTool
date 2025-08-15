# LogArchiveTool
This repository is for a bash script that I created as a solution for the "Log Archive Tool" this [project](https://roadmap.sh/projects/log-archive-tool).
# Create Testing Log File
```sh
mkdir target-dir
cd target-dir
touch log{1..10}
for i in {1..10}; do echo "This is the log file $i" > log$i; done
```
# How To Run
1. Clone the project:
```sh
git clone https://github.com/EADDRINUSE-98/LogArchiveTool.git
```
2. Go into the project:
```sh
cd LogArchiveTool
```
3. Give `log-archiver.sh` executable permissions:
```sh
chmod 744 log-archiver.sh
```
4. Run this command to see help page:
```sh
./log-archiver.sh --help
#or
./log-archiver.sh -h
```
5. Run this command to make an archive to current directory:
```sh
./log-archiver.sh target-dir/
```
6. Run this command to make an archive and store it to some other location:
```sh
./loglog-archiver.sh target-dir/ /tmp
```
# Format of Archive Name
```sh
logs_archive_20250815_203747.tar.gz
```
1. `20250815` - Date of creation in `yyyymmdd` format.
2. `203747` - Time of creation in `hhmmss` format.
# Considerations
Please keep in mind that is script is not the most optimal solution. So, feel free to temper with this script and make your own solution from it.