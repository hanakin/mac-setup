# \\[._.]/ - Hi, I'm Lucy an OSX setup bot

I will update your OSX machine with better system defaults, preferences, software configuration and even auto-install some handy development tools and apps that your developer friends find helpful.

# Forget About Manual Configuration!

Don't you hate getting a new laptop or joining a new team and then spending a whole day setting up your system preferences and tools? Me too. That's why we automate; we did it once and we don't want to do have to do it again.

# Watch me run!
![Running](http://media.giphy.com/media/5xtDarwenxEoFeIMEM0/giphy.gif)

# Running

Note: I recommend forking this repo in case you don't like anything I do and want to set your own preferences (and pull request them!)

Don't have git installed yet (fresh machine)?
Just download the zip file for this project, unzip it into ~/.dotfiles then
```bash
cd ~/.dotfiles;
./install.sh;
```

> Note: running install.sh is idempotent. You can run it again and again as you add new features or software to the scripts! I'll regularly add new configurations so keep an eye on this repo as it grows and optimizes.

# ¯\\_(ツ)_/¯ Warning / Liability
> Warning:
The creator of this repo is not responsible if your machine ends up in a state you are not happy with. If you are concerned, look at install.sh and all the scripts in the ./scripts folder to review everything this bot will do to your machine :)

# Settings
This project changes a number of settings and configures software on OSX.

# Contributions
Contributions are always welcome in the form of pull requests with explanatory comments.

Please refer to the [Contributor Covenant](https://github.com/atomantic/dotfiles/blob/master/CODE_OF_CONDUCT.md)

# Loathing, Mehs and Praise
1. Loathing should be directed into pull requests that make it better. woot.
2. Bugs with the setup should be put as GitHub issues.
3. Praise should be directed to [@antic](http://twitter.com/antic) or [@matthewmccull](http://twitter.com/matthewmccull) or [@midaym](http://twitter.com/midaym) or [@mathiasbynens](https://github.com/mathiasbynens/dotfiles)

# Release History

### <sup>v1.1.0</sup>
 * Added dotfiles backup and restore.sh script
     * you can now restore your previous dotfiles with ./restore.sh
 * prompting the user more (e.g. `brew upgrade` is now optional)

 ### <sup>v2.0.0</sup>
  * Overhauled and recreated everything from scratch in more organized sub scripts
