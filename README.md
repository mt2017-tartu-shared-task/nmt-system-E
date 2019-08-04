# Power Rangers In-class Machine Translation Shared Task 2017 Submission
This repository is a result of our participation in the shared task.<br>
We went through the process of building, analyzing, and improving the neural machine translation system.

Poster: [link](https://github.com/mt2017-tartu-shared-task/nmt-system-E/blob/master/reports/poster_nmt.pdf)

The shared task was for Estonian-English language pair. 
It included working with ~19.000.000 sentence pairs.

Shared task main page: [link](https://github.com/mt2017-tartu-shared-task) <br>
Shared task on course page: [link](https://courses.cs.ut.ee/2017/MT/fall/Main/SharedTask)

Sections below summarize key milestones we went through.  

##  Baseline system
- Our baseline system was 2-layer LSTM with 500 hidden units on both the encoder/decoder with vocabulary size of 20000.
- As a result, we got 21.14 BLEU points on the shared dev set.

More details: [link](https://github.com/mt2017-tartu-shared-task/nmt-system-E/blob/master/reports/Report1.md)

## Baseline system manual evaluation
- We manually analyzed 60 baseline translations. 
- Our main observation was that the next problems exist:<br>
1. Grammatical problems:<br>
1.1 Passive voice lost<br>
1.2 Wrong abbreviation used. <br>
2. Sentence meaning problems:<br>
2.1 Reversed meaning used<br>
2.2 Important words are lost<br>
2.3 Meaning totally changed<br>
2.4 Losts in meaning of relations between subject in sentence.<br>

- Take a look at our motivating example produced by baseline system. You can see relevant examples in relevant numbers, and bold color for current problematic part:<br>
1.1 "Even   traditional   websites   die,   which   has   killed   a continuous   flow   of   information   from   social   networks." <br>
1.2 "In   order   to   understand   the   size   of   this   figure,   1   TEN   is about   this   energy,   which   is   used   by   flying   mosquito." (In original sentence 1 TeV as unit mentioned).<br>
2.1 "The   economy   has   good   times,   partly   because   the   EU countries   conclude   customs   duties   on   trade." (where in right translation custome duties are stoped).<br>
2.1 One more example: "Thanks   to   this,   every   student   and   other   student   are aware   of   Erasmus,   Leonardo   and   other   cross-border partnerships." (in right translation students like student programs).<br>
2.2 "Since   pollution   does   not   feel   borders,   the   EU   has   been collectively   acting   in   this   area   for   years". (In original sentence, not EU itself, but its members).<br>
2.2 "Two   sides   discussed   the   views   of   the   international climate   change   debate   in   Copenhagen." (In original example, the debate took place in December).<br>
2.3 "Mr   Maris   Selga,   who   is   represented   in   the   Arab Republic   of   Egypt,   is   represented   by   Latvia." <br>
2.4 "You   are   one   of   our   biggest   customers   and   we appreciate   the   commercial   transactions   you   have   done." (where in original sentence they appreciate transactions with them).<br>

More details: [link](https://github.com/mt2017-tartu-shared-task/nmt-system-E/blob/master/reports/NMT%20lab3.pdf)

## Final system
- In order to address translation issues found after our manual evaluation we 
- increased the vocabulary size (from 20000 to 50000) 
- Dropout tunning.
- Sockeye model training and tuning.
- The trained system gave us 24.56 BLEU points on the shared dev set that means we have satisfactory increase (3.42) over the baseline. (Including that sockeye model has not been evaluated for technical reasons, details below).

More details: [link](https://github.com/mt2017-tartu-shared-task/nmt-system-E/blob/master/reports/Report3.md)

## Final system manual evaluation
- Generally speaking, new model shows significantly better translation with less meaning loss and grammatically more correct. 
- As a result you can see that our final system did progress in solving previously mentioned issues (numbered as problems above):<br>
1.1 "Even the traditional website dies , which has been killed by the constant force of the continuous information voiced by social networks."<br>
1.2 "In order to understand the size of this size , 1 TEV is about the energy that is used to move a mosquito." <br>
2.1 "There are good times in the economy, partly because EU countries will end customs duties on customs collection"<br>
2.1 Second example: "Thanks to this , every student and other learner know the Erasmus , Leonardo and the other cross-border partnerships."<br>
2.2 "Since pollution does not feel borders , EU countries have been acting together for years."<br>
2.2 "Two sides discussed the views of the international climate change debate in Copenhagen in December."<br>
2.3 "Latvia is represented by Maris Selga since the Arab Republic of Egypt."<br>
2.4 "You are one of our biggest clients , and we appreciate business transactions with you."<br>

Do not forget to check our poster: [__POSTER_LINK__]

## What we also tried or wanted to try
Firstly we have tried increasing of vocablulary size and three different dropouts: 0.3, 0.5, 0.7. As dropout:0.3 gave the best results, we have chosen this one, and will not include results of models with other dropout (0.5, 0.7).<br>
Model with dropout 0.5 gave score 23.35<br>
Model with dropout 0.7 gave score 18.55<br>
Lastly, we have also trained Sockeye model (1-layer bi-LSTM encoder, 1-layer LSTM decoder with dot attention), but right now translation of this model is in queue on Rocket, so we will include translation results, when script will be exexcuted.<br>


## Final words
- __1st_sentence: your_results_on_the_test_set_and_interpretation_(feel_later)__
- The main dificulties are connected to the hardware we have to work with (rocket.hpc.ut.ee) as we always suffered from being queued for a long time, which then resulted in time losses for model traning and evaluating of generated translations. 
- The more data you feed to the model - the better results you achive. We are not claming that model tuning process is insufficient but it is always has high timecost which often is not payed with appropriate improvements. So we would better work on data extension first and then try to play with existing tutings settings for the model and regenerating features for the "new" model.


## Team members:
@yevhen-tyshchenko

@dimatkachuk

@BreakINbaDs

Project board: [link]()

