 # What is mining ? Why is it important in the field of blockchain ?
 Mining simply is process of validating and verifying the transactions.
 
Since mining is what adds block to the network and  is computationally heavy . For an participant to create an fault transaction have to race against all other honest participants which is practically impossible. Hence it creates an trust-less system.You don't have to trust just verify the block.
 
 # What is Block and list out the elements inside the block.
 Block is the data structure in the  blockchain which are linked to one another .It is where data are stored.<br>
 Elements inside of the block : 
 1. Nonce 
 2. Block Number
 3. Time Stamp
 4. Data (Code or Transaction)
 5. Block Hash
 6. Previous Block Hash
 
  # What is Nonce and Target in Blockchain Mining ?
  Nonce is an 32 bit Integer which is in the control of miner.Miner can change the nonce to create an hash less than the target.
  
 Target is an hash fixed by the blockchain network every 2 weeks. For an block to be added into the network miner have to come up with the hash less then the target .
 <br>
 i.e
 <br>
 ' SHA256(Block Number, Timestamp, Nonce, Data, Prev. Block’s Hash) -> Hash <br>
 This hash must be smaller then the target hash
