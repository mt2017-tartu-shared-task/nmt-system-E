# Milestone 3: Report on planned modifications

### Main issues
1. Lack of vocabulary
2. Bad BPE splitting
3. Out of context translations
4. Poor translation of long sentences

### NMT modifications 

##### Increase the vocabulary size. Deadline: 6.11 
We got errors that we considered as a result of small vocabulary used for training.

1. Source: Kui elektron ja antielektron saavad kokku, hävitavad nad üksteist, mulle tulemuseks on energiapurse.
2. Human: When an electron and an antielectron meet, they annihilate each other, producing a burst of energy.
3. Machine: If the power and the antielectric power are together, they destroy each other, the result is the energy pressure.

We believe that the bigger vocabulary will at least slighty improve all of the translations.

##### Fix BPE splitting. Deadline: 6.11
The example below represents the errors caused by bad BPE splitting. In particular, "PH-funktsioon" translation was completely dropped because the hyphen-delimited words were not handled properly.

1. Source: Praegu puudub investeerimisosakonnal PH-funktsioon.
2. Human: At present the Investment department has no HRM function.
3. Machine: There is currently no investment department.

##### Increase the beam size and use sockeye. Deadline: 13.11 - 20.11 (depends on sockeye implementation issues)
Increased beam size will bring system more options to choose from among the possible translations. Moreover, handling long sentences as chunks could prevent the connections' weights between source and possible translations to vanish because of length factor. 

1. Source: Saate sisestada kommentaare (kommentaar: märkus või kokkuvõte, mille autor või läbivaataja dokumendile lisab. Microsoft Word kuvab kommentaarid dokumendi veerisel jutumullis või läbivaatuspaanis.) jutumulli sisse (jutumullid: küljendivaates või veebivaates kuvatakse märgistusmullis märgistuselemendid (nt kommentaarid ja jälitatud muudatused) dokumendi veeristel. Kasutage neid jutumulle, et lihtsalt vaadata ja vastata läbivaatajate muudatustele ja kommentaaridele.), mis ilmuvad dokumendi veeristel.
2. Human: You can insert a comment (comment: A note or annotation that an author or reviewer adds to a document. Microsoft Word displays the comment in a balloon in the margin of the document or in the Reviewing Pane.) inside balloons (balloons: In print layout view or Web layout view, markup balloons show markup elements, such as comments and tracked changes, in the margins of your document. Use these balloons to easily see and respond to reviewers' changes and comments.) that appear in the document margins.
3. Machine: You can enter comments (for example, a note or a summary of which the author or the inspector attaches. Microsoft Word is displaying comments in the column of the document) in the column of the document.
To fix this problem we want to try another splitting algorithm. Therefore we picked "wordpiece", which is a variant of BPE. The final vocabulary size is fixed. 

##### Try out the transformer models with self-attention. Deadline: 20.11+
In the transfromer model each word is considered in the context of other words. This sounds quite promising because it could help with both long sentences handling and enrich each input word with its context.

1. Source: Suulised kommentaarid lisatakse kommentaari jutumullidesse heliobjektidena.
2. Human: Voice comments are added as sound objects inside comment balloons.
3. Machine: Oral comments shall be included in the comments on the sounding of sound plants.

##### Hyperparameter tuning: dropout (optional)
Dropout tuning, in general, improves neural models so we decided to try out different values if we have time for it.
