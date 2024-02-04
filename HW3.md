# What is a mining pool ?
In this instead of every miner doing their own mining .In pool they join hands and share their computation power to one another . More the computation power more is the probability to find the target . And the rewards are distributed among the pool members.

# What is a timestamp ? How is it important for Blockchain ?
Timestamp in the block is the time (unix time) at which the block have been created. 

The nonce has 4 Billion combination which will take 40 seconds on average for an miner to exhaust . But if the block is mined by a mining pool or some heavy dedicated computational device then It can take much less.But what if target is not acheived (say it is exponently low) The miner needs another variable to fiddle around.Time stamp , for every second passing the timestamp is increased by 1 generating a completely new hash with same nonce. Hence, miner can again create new hash. 
 (It turns out the nonce can be exhausted within a second therefore , Miner chooses other transactions from the mempool and exhaust its nonce -- since transaction(data) is changed new hash is created again )
