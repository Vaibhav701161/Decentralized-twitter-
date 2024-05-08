# Decentralized-twitter-

Description

This Solidity smart contract implements a basic decentralized Twitter-like application on the Ethereum blockchain. Users can:

Create tweets with a maximum length (configurable by owner).
Like and unlike other users' tweets.
Retrieve their own tweets (by index or all tweets).
Features:

Tweet Creation and Management: Users can create and manage tweet length.
Likes and Unlikes: Users can like and unlike tweets, updating the like count.
Tweet Access: Users can fetch their own tweets for efficient retrieval.
Events: The contract emits events for transparency (tweet creation, likes, unlikes).
Ownership: Only the contract owner can change the maximum tweet length.
