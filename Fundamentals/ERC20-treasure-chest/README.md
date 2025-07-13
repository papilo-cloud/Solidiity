# ERC20 Treasure Chest
In this challenge you will create a contract that can transfer multiple ERC20 balances from the contracts address to function caller's address.

## 1: Plunder
### ERC20 Treasure Chest
> Arr... matey, It's time to **plunder the ERC20 Treasure Chest!**

Many ERC20 tokens have been sent to the `Chest` contract. It's your job to to write a function that will allow someone to `withdraw those tokens`.

To accomplish this, the function will need to interact with several ERC20 Token Contracts. It will need to find the token balance for the `Chest` contract address for each of these tokens and then it will need to transfer that balance to the caller of the function.

### Your Goal: Plunder 
1. Create an external function called `plunder` which will take an **array of addresses** as its only parameter. There will be an ERC20 Token deployed to each of these addresses in the array.
2. In the `plunder` function, transfer the entire balance of each of these tokens owned by the `Chest` address and send them to the `msg.sender.`
> For instance, the tests will deploy a token with a supply of 10000 and send 1000 of those tokens to the `Chest` address. Then it will then send the token address to the `plunder` function on the `Chest`. This function should move the tokens from the `Chest` address to the address of the `msg.sender.`

You can use the `IERC20.sol` interface to interact with the functions necessary to accomplish this goal.