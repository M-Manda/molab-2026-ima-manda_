# molab-2026-ima-manda_

- Midterm checklist
  - [yes] weekly description of homework progress/challenges in your wiki page
  - [yes] added jht9629-nyu as collab on your repo
  - [yes] uploaded at least one photo in MoGallery TestFlight App
  - [yes] able to build and run example apps own iPhone
  - [yes] installed Xcode 27
  - [yes] watched at least one WWDC video
  - [yes] Upload profile photo to HOS-Lobby app

# Week 1
Python background helps a lot, but new language is always a struggle. I did 100 days Swift from days 1 to 7. It was pretty straight forward. I spent around 30 minutes to an hour each day. 
https://github.com/M-Manda/molab-2026-ima-manda_/tree/main/week1/MyPlayground1.playground/Pages

# Week 2
Did 100 days Swift from 7 to 14.
I made a dino game animation. It prints out new frames every second. I the each individual items separately, and printed them next to each other. Each line is the first line of each item, then the second line of each item and so on working like a printer. The cactuses and birds show up randomly and they pass by one by one giving the illusion of dino walking. Dino jumps up and down on every frame. On odd frames it jumps down, and on even frames it jumps up.
https://github.com/M-Manda/molab-2026-ima-manda_/tree/main/week02

# Week 3
Did 100 days Swift 16, 17, 18. Made the WeSplit app. I think it's actually very useful to have it on my phone. Plus, I can brag about it to my friends when we have a dinner together. Here's a the link to [WeSplit](https://github.com/M-Manda/molab-2026-ima-manda_/tree/main/week3/WeSplit)

Completed two challenges from Grid Playground from the [00-molab-2026-jht](https://github.com/molab-itp/00-molab-2026-jht). I made a checkerboard and changed \[ [String] \] to [String]. Here's the link to [Grid](https://github.com/M-Manda/molab-2026-ima-manda_/tree/main/week3/grid.playground)

Made 2 10print images. One has \\ / pattern and the other one has - | pattern. The slider adjusts the thickness and the "Again" button redraws the picture. Canvas10print is based on https://github.com/molab-itp/03-Canvas-Explore and the sider was from Page7 of https://github.com/molab-itp/03-ImageUiDemo-1-symbols. Here's the link to [Patterns](https://github.com/M-Manda/molab-2026-ima-manda_/tree/main/week3/Pattern)

# Week 4
I made Vivaldi four seasons themed trees. When you play four seasons, the trees switch between seasons changing the music and their leaves color. The Autumn one playes a tree's leave falling animation. [week4](https://github.com/M-Manda/molab-2026-ima-manda_/tree/main/week4)

I used the random pattern from week3's homework. They have random placement, length and slope. It checks if the leaf is in the tree area and if it's not, it doesn't draw that leaf.

It was challenging to make the audios fade in and fade out.

# Week 5
I made a Simon Says game. I heavily relied on the class examples [05-TimerDemo](https://github.com/molab-itp/05-TimerDemo) and [05-Heart-Shapes](https://github.com/molab-itp/05-Heart-Shapes). I used Button for the game, but I think I should switch to .onTapGesture.

You play by clicking on the start button first, and the app will play a sequence of 5 color taps. You click them on reverse order to get it correct. I thought that would be more challenging.
For the final project, I also want to make a game.

# Week 6
I added a game history to my Simon Says game. Every round is saved to a file, so your past games are still there after you close and reopen the app. There’s a new History page that lists each game as Correct or Incorrect, with the newest one at the top. I followed the class example [06-ImageEditDemoJSON](https://github.com/molab-itp/06-ImageEditDemoJSON) step by step and changed it to save games instead of images. [week6](https://github.com/M-Manda/molab-2026-ima-manda_/tree/main/week6)

I also copied the saved file (history.json) into my week6 folder so you can see what the data looks like.

Problems: Xcode gave me two warnings. I fixed one by adding encoding: .utf8 and the other by using Text(verbatim:). I also learned that an iPhone app can only save files inside its own private folder.

Plans: Add levels, so each level has one more light than the last.
