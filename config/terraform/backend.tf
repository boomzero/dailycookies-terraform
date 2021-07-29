terraform {
  backend "remote" {
    organization = "emyeukhoahoc"

    workspaces {
      name = "<%= expansion('dailycookies-tfc-:ENV') %>"
    }
  }
}