printf "\n<<<<<<<<<<<<<<< Installing sqlite >>>>>>>>>>>>>>>\n"
brew install sqlite
wait  
printf "\n<<<<<<<<<<<<<<< Installing mysql >>>>>>>>>>>>>>>\n"
brew install mysql
wait  
printf "\n<<<<<<<<<<<<<<< Installing free-tds >>>>>>>>>>>>>>>\n"
brew install freetds
wait  
printf "\n<<<<<<<<<<<<<<< Installing openssl >>>>>>>>>>>>>>>\n"
brew install openssl
wait
printf "\n<<<<<<<<<<<<<<< Installing RVM most recent Stable version >>>>>>>>>>>>>>>\n"
curl -L https://get.rvm.io | bash -s stable
wait
printf "\n<<<<<<<<<<<<<<< Adding lines to you bash profile to source RVM >>>>>>>>>>>>>>>\n"
echo '# For RVM install' >> $HOME/.bash_profile
echo '[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*' >> $HOME/.bash_profile
echo '. ~/.bashrc' >> $HOME/.bash_profile
wait
printf "\n<<<<<<<<<<<<<<< Loading RVM inta session >>>>>>>>>>>>>>>\n"

# Load RVM into a shell session *as a function*
if [[ -s "$HOME/.rvm/scripts/rvm" ]] ; then

  # First try to load from a user install
  source "$HOME/.rvm/scripts/rvm"

elif [[ -s "/usr/local/rvm/scripts/rvm" ]] ; then

  # Then try to load from a root install
  source "/usr/local/rvm/scripts/rvm"

else

  printf "ERROR: An RVM installation was not found.\n"

fi
wait 
source $HOME/.bash_profile
wait
printf "\n<<<<<<<<<<<<<<< Verifying rvm is a function >>>>>>>>>>>>>>>\n"
type rvm | head -n1
wait
printf "\n<<<<<<<<<<<<<<< Installing latest stable Ruby 1.8.7 >>>>>>>>>>>>>>>\n"
rvm install 1.8.7-p371
wait
printf "\n<<<<<<<<<<<<<<< Checking the RVM System >>>>>>>>>>>>>>>\n"
rvm system
wait
printf "\n<<<<<<<<<<<<<<<Setting RVM default as 1.8.7>>>>>>>>>>>>>>>\n"
rvm use 1.8.7-p371 --default
wait
printf "\n<<<<<<<<<<<<<<< Verifying Which Ruby >>>>>>>>>>>>>>>\n"
which ruby
wait
printf "\n<<<<<<<<<<<<<<< Creating .gemrc to suppress ri and rdoc >>>>>>>>>>>>>>>\n"
touch ~/.gemrc
echo "gem: --no-ri --no-rdoc" >> ~/.gemrc


printf "\n######################################################################\n"
printf "     You are now ready to program in Ruby on Rails. Have Fun. I am.   \n"
printf "######################################################################\n"

######################################################################
#Allows the ability to create a gemset when creating a new app
######################################################################
printf "\n<<<<<<<<<<<<<<<Creating createapp command>>>>>>>>>>>>>>>\n"
FILE="bin/createapp"
touch $FILE
wait
echo "# Load RVM into a shell session *as a function*" >> $FILE
echo "if [[ -s '$HOME/.rvm/scripts/rvm' ]] ; then" >> $FILE
echo "# First try to load from a user install" >> $FILE
echo "source '$HOME/.rvm/scripts/rvm'" >> $FILE
echo "elif [[ -s '/usr/local/rvm/scripts/rvm' ]] ; then" >> $FILE
echo "# Then try to load from a root install" >> $FILE
echo "source '/usr/local/rvm/scripts/rvm'" >> $FILE
echo "else" >> $FILE
echo "printf 'ERROR: An RVM installation was not found.\n'" >> $FILE
echo "fi" >> $FILE
echo "rvm gemset create app\$1" >> $FILE
echo "rvm gemset use app\$1" >> $FILE
echo "rvm 1.8.7-p371@app\$1" >> $FILE  
echo "printf '\n\n**************** Installing Rails, this may take a while ***************\n\n'" >> $FILE
echo "gem install rails" >> $FILE
echo "printf '**************** Creating app\$1, this may take a while ***************\n\n'" >> $FILE
echo "rails new app\$1" >> $FILE
echo "cd app\$1" >> $FILE
echo "printf '**************** Executing the bundle install command, this may take a while ***************\n\n'" >> $FILE
echo "bundle install" >> $FILE
echo "rvm --rvmrc --create 1.8.7-p371@app\$1" >> $FILE
echo "cd " >> $FILE
chmod +x $FILE
wait

######################################################################
# Sets up custom command for checking out and existin project from subversion
######################################################################

printf "\n<<<<<<<<<<<<<<<Creating getapp command>>>>>>>>>>>>>>>\n"
FILE_2="bin/getapp"
touch $FILE_2
wait
echo "# Load RVM into a shell session *as a function*" >> $FILE_2
echo "if [[ -s '$HOME/.rvm/scripts/rvm' ]] ; then" >> $FILE_2
echo "# First try to load from a user install" >> $FILE_2
echo "source '$HOME/.rvm/scripts/rvm'" >> $FILE_2
echo "elif [[ -s '/usr/local/rvm/scripts/rvm' ]] ; then" >> $FILE_2
echo "# Then try to load from a root install" >> $FILE_2
echo "source '/usr/local/rvm/scripts/rvm'" >> $FILE_2
echo "else" >> $FILE_2
echo "printf 'ERROR: An RVM installation was not found.\n'" >> $FILE_2
echo "fi" >> $FILE_2
echo "cd $HOME/rails_projects/" >> $FILE_2
echo "svn co svn://apptest.uwec.edu/webdev/app\$1/trunk app\$1" >> $FILE_2
echo "cd" >> $FILE_2
echo "rvm gemset create app\$1" >> $FILE_2
echo "rvm gemset use app\$1" >> $FILE_2
echo "rvm 1.8.7-p371@app\$1" >> $FILE_2 
echo "rvm --rvmrc --create 1.8.7-p371@app\$1" >> $FILE_2
chmod +x $FILE_2 
source $HOME/.bash_profile

sudo mv bin/createapp /bin/
wait
sudo mv bin/getapp /bin/
wait

printf "\n<<<<<<<<<<<<<<<Install Complete>>>>>>>>>>>>>>>\n"
printf "You can now use the command createapp followed by the app number\n"
printf "    This calls the rails new command with app adn a prefix and the app number is appended\n"
printf "    It also creates a matching gemset and svn repository\n"
printf "    The app is created inside your pwd\n"
printf "      So make sure you are in you rails_projects folder\n"
printf "\n"
printf "You can also use the command getapp followed by the app number\n"
printf "    To checkout an app from the repository\n"
printf "    The app is saved inside your rails_projects folder\n"
printf "____________________________________________________________________\n"
printf "Enjoy my hard work and boredom in creating this script, Chris Haynes\n\n"
printf " ****** P.S. Keep your eye on Teske, and dont talk to him about Guns, Trust me ******\n\n\n"
