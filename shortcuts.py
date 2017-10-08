def read_file(f):
    with open(f, "r") as fi:
        tmp = fi.read() + "\n"
        fi.close()
        return tmp

rang = read_file("./ranger/rc.conf")
bash = read_file("./bash/bashrc")
fish = read_file("./fish/config.fish")

configs = open("./Scripts/configs", "r")
folders = open("./Scripts/folders", "r")

for line in configs:
    if not line.strip():
        continue
    ln = line.split()

    rang += "map {} shell vim {}\n".format(*ln)
    bash += "alias {}=\"vim {}\"\n".format(*ln)
    fish += "alias {}='vim {}'\n".format(*ln)

for line in folders:
    if not line.strip():
        continue
    ln = line.split()

    rang += "map g{} cd {}\n".format(*ln)
    rang += "map t{} tab_new {}\n".format(*ln)
    rang += "map m{} shell mv %s {}\n".format(*ln)
    rang += "map Y{} shell cp -r %s {}\n".format(*ln)

    bash += "alias {}=\"cd {} && ls -a\"\n".format(*ln)
    fish += "alias {}='cd {}; ls -a'\n".format(*ln)

def writeFile(f, content):
    with open(f, "w+") as fi:
        fi.write(content)
        fi.close

writeFile("./ranger/.rc.conf.comp", rang)
writeFile("./bash/.bashrc.comp", bash)
writeFile("./fish/.config.fish.comp", fish)
