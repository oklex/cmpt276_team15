# CMPT276 - Team 15's Project
* Group 15's project for CMPT276
* Members: Alexander, Tyrell, Thu, Aleksandar, Darren

## Project Abstract
The game, (temporarily named) "It has to do with Elements and Stuff" is a web application game. The game will be a 2 dimensional twin stick shooter, and while it is meant to be played on a computer, it will also support APIs for plugging in an old video game controller to use and play with and facebook APIs to share stats with friends (and encourage them to join). In the game itself, the player entity will be able to move around on a 2d map using elemental projectiles to combat different types of enemies - each with unique resistances and weaknesses. Live multiplayer co-operative modes will be allowed.  By playing more and winning achievements, players will collect points. They will be able to use the in-game currency to purchase additional abilities, upgrades, and gear. The game, will be fun to play in short rounds, or marathons, with friends, or alone. Collecting and purchasing different items will also be a core feature of the game that encourages players to keep playing. Player accounts will track their purchases (upgrades, abilities, gear), their top scores, leaderboards, statistics, achievements, and friends list.

## Customer
The primary customer will be casual gamers looking for a quick but engaging game with low time commitment. Appealing to casual gamers with a simple gameplay style on the surface, the game will present challenges and difficulty to appeal to a wider range of gamers and present a mix of short and long term rewards (with an amount of randomness for addictive value).

## Competitive Analysis
Our competitors are all small to medium game studios that have an established presence in the market. Any games with similar characteristics of our games such as:  ease to target mass market, highly addictive and engaging value and perfect time-killers can be competitive products to ours. Geometry Wars is the inspiration of our product that closely resembles our structure. Geometry Wars has high-quality graphic designs, as well as many levels from easy to difficult that motivate players to come back and challenge themselves. There are many other mobile apps and web apps that integrate Geometry War’s ideas, but they rarely enable multiplayers or present comparable sophisticated model. Thus, we attempt to address these current drawbacks with different strategies.

Our game is web app; therefore, it is freely available to anyone who has access to Internet. The statistics published by Big Fish Game shows that in 2017, 54% of gamers play with others. Multiplayer cooperative mode is integrated that allow up to four players to fight together at the same time. Adding to that, more complex enemy and combat system are constructed. The enemies and weapons may be divided into different groups that have greater or less resistance toward each others. If time permits, we can incorporate multiple levels with different themes that add more variety to the game.

We believe that the above strategies will make our web game competitive. The global games market is projected with healthy growth of 6.2% in the period from 2016 to 2020 (newzoo, 2017). In this scope of our project, we will focus on building a web app game. However, with the possibility of moving to mobile platform, this app has huge potential to catch up with the mobile trend in the future.

## User Stories
### Project Proposal
Jacky has been really stressed out about his upcoming midterm tomorrow, he’s been studying for 5 straight hours and is ready to take a break. With feelings of self-doubt creeping in, he wants to do something fun without shutting down his brain. He decides to start up (temporarily named) “It has to do with Elements and Stuff”  his new favourite game. Jacky presses “Play Now” and the game fires up its vicious AI scripts as it sends waves of varied enemies hurdling at him. As Jacky takes the final killing blow to his character he’s presented with a screen that tells him he’s reached a new highscore, propelling him to 6th on the leaderboards! He’s also finally earned the “Reach 1,000,000 Points in a Single Game Achievement” that he’s been striving to achieve for oh so long. This rush of dopamine and adrenaline was exactly the boost he needed to reinvigorate his confidence heading into another 3 hours of studying. With the share to Facebook button, we as developers will get closure in knowing we’ve helped out a fellow student when we see the facebook post from Jacky about his new highscore and pumped of confidence heading into the exam tomorrow.

John is the administrator of the (temporarily named) “It has to do with Elements and Stuff”. Regularly, he logins and checks his chatbox messages from other regular users addressing any issues they may have. For example, users’ information is not record accurately. As an administrator, he can access to individual account to manually review and update user information such as status, scores, assets, achievements, etc. Sometimes, he needs to resolve conflicts between users. For examples, some users may use offensive language while communicating with other users. John then can review the chatbox transcripts and decide if he should ban users by removing their account. If there is a bug that causes uneven score distribution when players play in multiplayer mode, John can cross-check to the database to resolve any inconsistent issues. Occasionally, John can put the games into maintenance mode if there are any updates or bug fixing needed to be done.

### Iteration 1
Description: Signup and login for regular user
Actor/Personas: regular user Chris
Preconditions/Triggers: Chris want to play the game but when go to the page, it prompt him to sign in page before he can play the game. Since he doesn’t have account, he signup first.
Postconditions:
When signup, Chris need to provide username, name, password, password confirmation and email. If username or email is already existed, it will redirect back to signup page with corresponding error message. If the password and password confirmation are not matched, an error message will be display as well.

After signup, Chris will be redirected to login page. If Chris typed in incorrect email/username or password, it will redirect to Login page with corresponding error message. Once login success,  it should be redirected to games home page according to our interface design in the proposal.  

When Chris login, he/she can only view his/her profile and cannot go to other users’ profiles by modifying the URL.

When Chris logout, he will be redirected to login page.

Description: Admin profile  page is different from regular users
Actor/personas: John is admin of the web app
Precondition/Trigger: John need to login just like other users to play game and perform admin task
Postconditions/Actions:
When admin users login, he should be redirected to admin profile that has different view from regular user. He has access to all user lists by clicking on the “index” link.

NOTE: There is one admin in which is manually set in the database for the demo. The admin username is: ‘admin’ and password is: ‘AdminP@ssw0rd’.

### Iteration 2
Description: Update user information
Actors/personas: regular user (Steve)
Precondition and Triggers:
Steve recognizes that it has been 1 year since she graduated from university and his school email will soon be revoked. Steve want to update his profile with different email address.
Actions/ Postcondition:
Steve goes to the web app and choose “Settings". He updates his account with the new email address

Description: Assign a user as an admin
Actors/personas: John is the administrator
Precondition/ Triggers:
John cannot perform administrative role in a period. He want to set someone else as admin.
Actions/ Postconditions:
After logging in, John can see the list of all users by clicking on “Index". John finds Steve among the users and see that she is not an admin yet. John then click on “Edit” and set Steve as user then choose “update user". After that, John is redirected back to User index page and see that his change is successfully saved.

Description: Single player game play
Actor/personas: Bob is a student and regular user
Precondition/ Triggers:
Swamped student Bob is looking to unwind for a bit
Action/ Postconditions:
Bob loads the game in webpage, and decides to play a single player game. He can choose one of 5 elements to use to defeat waves of enemies. Every element is strong against one of the other elements, i.e. water beats fire.
Bob can:
	-start the game by pressing the spacebar
	-play again when he loses by pressing the R key
-move around with WASD
-move the mouse around to aim at enemies
-shoot projectiles at enemies to kill them with the left mouse button
-Use the F key, 1 2 3 4 5 keys, or mouse scroll wheel to cycle through elemental    projectiles
Bob cannot:
-leave the boundaries of the level otherwise he will lose
-continue his current game after getting hit four times; his score will be reset upon playing again
After playing the game for a bit, Bob has reached a new high score and is satisfied with his relaxation time going into this game.
(The animations are not all complete for this iteration)

## Velocity
| Stories | Story points |
| ----------- |-------------|
| User login, logout, signup | 3 |
| Admin has different profile page | 1 |
| User update their own information | 1 |
| Admin can see list of user and update other users' information | 1 |
| Single player game with animation | 8 |

Each point is approximately half day of works (4 hours). For iteration 2, there are total 10 story points completing in 2 weeks by a team of 5 people. Comparing to iteration 1, there is increasing in velocity.


## User interface requirements
There will be five main user interface pages in this game.
The first is a main menu screen with options to play the game single player, multiplayer, view your profile, change settings, and quit the game. There will also be a leaderboard on the side to show you the highest scores so far in the game.
The second is the profile page. This page shows you all the achievements you have completed, your statistics in game (such as number of enemies defeated, number of times each elemental weapon was used, number of deaths, etc.), your inventory (upgrades, aesthetic features, etc) and your currency/points. The currency/points are used to buy upgrades and other things stored in your inventory.
The third is the multiplayer lobby. This will be where you wait for others to join your game, and will show you a list of all of you friends.
The fourth is the single player “arena”. This is where you play the game in single player mode. There will be an area of the screen devoted to displaying the current elemental attack you are using, as well as bars that fill up for each element. When the bar is full, a super attack can be used to clear the screen of enemies.
The fifth is the multiplayer “arena”. This is where you play the game with others. The elemental bars are still shown, and only display your stats in terms of progress to getting a super attack.
