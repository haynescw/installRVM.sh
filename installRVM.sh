printf "\n<<<<<<<<<<<<<<<Installing openssl>>>>>>>>>>>>>>>\n"
brew install openssl
wait
printf "\n<<<<<<<<<<<<<<<Installing RVM most recent Stable version>>>>>>>>>>>>>>>\n"
curl -L https://get.rvm.io | bash -s stable
wait
printf "\n<<<<<<<<<<<<<<<Adding lines to you bash profile to source RVM>>>>>>>>>>>>>>>\n"
echo '# For RVM install' >> $HOME/.bash_profile
echo '[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*' >> $HOME/.bash_profile
echo '. ~/.bashrc\n\n' >> $HOME/.bash_profile
wait
printf "\n<<<<<<<<<<<<<<<Loading RVM inta session>>>>>>>>>>>>>>>\n"

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
printf "\n<<<<<<<<<<<<<<<Verifying rvm is a function>>>>>>>>>>>>>>>\n"
type rvm | head -n1
wait
printf "\n<<<<<<<<<<<<<<<Installing latest stable Ruby 1.8.7>>>>>>>>>>>>>>>\n"
rvm install 1.8.7-p371
wait
printf "\n<<<<<<<<<<<<<<<Checking the RVM System>>>>>>>>>>>>>>>\n"
rvm system
wait
printf "\n<<<<<<<<<<<<<<<Setting RVM default as 1.8.7>>>>>>>>>>>>>>>\n"
rvm use 1.8.7-p371 --default
wait
printf "\n<<<<<<<<<<<<<<<Verifying Which Ruby>>>>>>>>>>>>>>>\n"
which ruby
wait


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
echo "svn mkdir svn://apptest.uwec.edu/webdev/appxxx -m 'initial base for appxxx'" >> $FILE 
echo "svn mkdir svn://apptest.uwec.edu/webdev/appxxx/trunk -m 'initial trunk for appxxx'" >> $FILE
echo "rvm gemset create app\$1" >> $FILE
echo "rvm gemset use app\$1" >> $FILE
echo "rvm 1.8.7-p358@app\$1" >> $FILE
echo "gem install rails" >> $FILE
echo "rails new app\$1" >> $FILE
echo "cd app\$1" >> $FILE
echo "rvm --rvmrc --create 1.8.6-p358@app$1" >> $FILE
echo "mv config/database.yml config/database_example.yml" >> $FILE
echo "rm -r log/*" >> $FILE
echo "rm -r tmp/*" >> $FILE
echo "svn add ." >> $FILE
echo "svn commit -m 'Initial import of app'" >> $FILE
echo "svn propset svn:ignore database.yml config/" >> $FILE
echo "svn propset svn:ignore '*' log/" >> $FILE
echo "svn propset svn:ignore '*' tmp/" >> $FILE
echo "svn propset svn:ignore '*.sqlite3' db/" >> $FILE
echo "svn commit -m 'Ignoring files'" >> $FILE
echo "cp config/darabase_example.yml config/databse.yml" >> $FILE
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
echo "cd $HOME/rails_projects/" >> $FILE_2
echo "svn co svn://apptest.uwec.edu/webdev/app\$1/trunk app\$1" >> $FILE_2
echo "cd" >> $FILE_2
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
