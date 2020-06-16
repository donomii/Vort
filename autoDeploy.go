// autoDeploy
package main

import (
	"flag"
	"fmt"
	"os"
	"strings"
	"time"

	"github.com/donomii/goof"
)

type Repo struct {
	Path, Revision string
}

func getRevision(dir string) string {
	fmt.Printf("Checking revision for %v ... ", dir)
	oldDir, _ := os.Getwd()
	os.Chdir(dir)
	goof.QC([]string{"git", "pull"})
	new_revision := goof.QC([]string{"git", "rev-parse", "HEAD"})
	os.Chdir(oldDir)
	fmt.Printf("%v\n", new_revision)
	return new_revision
}

func main() {
	var command string
	var directories string
	var repos []Repo
	startDir, _ := os.Getwd()
	flag.StringVar(&command, "command", "", "deploy.exe")
	flag.StringVar(&directories, "dirs", ".", "List of git repositories, separated with |")
	flag.Parse()
	dirs := strings.SplitN(directories, "|", -1)
	fmt.Printf("Monitoring: %v\n", dirs)
	for _, dir := range dirs {
		repos = append(repos, Repo{dir, getRevision(dir)})
	}
	for {
		for _, r := range repos {
			new_revision := getRevision(r.Path)
			if new_revision != r.Revision {
				fmt.Printf("Rebuilding %v\n", startDir)
				r.Revision = new_revision
				os.Chdir(startDir)
				goof.QC([]string{command})
			}
		}
		time.Sleep(1 * time.Second)
	}

}
