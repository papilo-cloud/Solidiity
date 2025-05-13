# Quest 3

## Project repository for Quest 3 of StackUp's Token Standards Masterclass - ERC20.

### Step 1:
**Understanding the Project**

We’ll be building a simple vault that issues claim tokens to users who deposit tokens into the vault. For example, if 1 UNI is deposited into our StackUpVault, our vault will issue 1 sUNI to the user. Think of this sToken as the receipt of the amount of tokens that the user deposits. Let’s break this down into the two main functions of our vault - depositing and withdrawing.

First, the user must have some tokens, let’s use UNI tokens for our example. It all starts by the user depositing some UNI into our vault. When the vault receives tokens, it will mint an equal amount of the token’s corresponding claim tokens sUNI to the user.

When the user wishes to withdraw his deposited tokens UNI from the vault, he’ll call the withdraw function of the vault. Within the function, the burn function of the corresponding claim token sUNI will be triggered, burning the user’s claim tokens sUNI. Following which, the UNI which the user originally deposited will be transferred from the vault back to the user.

Now that we have a better understanding of the project we’ll be building, let’s start coding our smart contracts!


### Step 2:
**Creating sToken.sol**
As mentioned earlier, you will only be editing two files - **StackupVault.sol** and sToken.sol in the contracts folder. Do NOT edit any other files in the entire project directory. If you open up these files, you should see that there is some boilerplate code. You’ll need to complete these smart contracts based on the instructions given in this step.

After you’ve completed the smart contracts, you can test your smart contracts against a pre-completed test script - StackUpVault.js. Feel free to take a look at the code within StackUpVault.js to get a feel for what the script is testing for in your smart contracts, but do NOT edit any code within StackUpVault.js; doing so will result in the immediate rejection of your tutorial.

We’ll start with the first smart contract - sToken.sol.

Here’s what you’ll need to do:

- Declare that your contract inherits from `ERC20`, `Ownable`, and `ERC20Burnable`.
- Declare a `constructor` function that accepts two parameters - `_name` and `_symbol`. In the constructor, call the constructor of the parent contract ERC20, passing in the _name and _symbol parameters.
- Declare a `mint` function that accepts two parameters: `to` (the address to which the tokens will be minted), and `amount` (the amount of tokens to mint). This function should be `external` and only callable by the contract owner (`onlyOwner`).
- Inside the `mint` function, call the `_mint` function inherited from the ERC20 contract, passing the `to` and `amount` parameters.
- Declare a `burn` function that accepts two parameters: `to` (the address from which the tokens will be burned), and `amount` (the amount of tokens to burn). This function should also be `external` and only callable by the contract owner (`onlyOwner`).
- Inside the burn function, call the `_burn` function inherited from the ERC20Burnable contract, passing the `to` and `amount` parameters.
And we’re done with sToken.sol! As you can see, it’s very similar to our typical ERC20 smart contract, with the addition of the burn functionality.


### Step 3:
**Creating StackupVault.sol**
Now for the smart contract that serves as the command center of this project - StackupVault.sol. This is the smart contract that users will be interacting with; it’ll also be making use of the sToken smart contract we created in the previous step.

Here’s what you’ll need to do:

**Constructor**

- Within the `constructor`, initialize claimTokens with `new sToken` instances for `uniAddr` and `linkAddr` with their corresponding names and symbols. Use “Claim Uni” and “sUNI” for UNI’s token name and symbol respectively, and “Claim Link” and “sLINK” for LINK.
- Similarly, initialize `tokens` mapping for `uniAddr` and `linkAddr` with their corresponding `IERC20` instances.

**Deposit Function**

- In this function, call the `transferFrom` function on the IERC20 instance corresponding to `tokenAddr` to move the tokens from the message sender to this contract.
- Use a `require` statement to ensure the transfer was successful and throw an error message "transferFrom failed" otherwise.
- Call the `mint` function on the corresponding sToken instance to mint the claim tokens to the message sender.

**Withdraw Function**

- In this function, call the `burn` function on the sToken instance corresponding to `tokenAddr` to burn the claim tokens from the message sender.
- Call the `transfer` function on the IERC20 instance corresponding to `tokenAddr` to move the tokens from this contract to the message sender.
- Use a `require` statement to ensure the transfer was successful and throw an error message "transfer failed" otherwise.

And we’re done! Once you’ve completed your smart contracts, go ahead and run it against the test script to see if your code is correct. To do so, run the command below in your terminal.

<pre>
npx hardhat test
</pre>

If your smart contracts were coded correctly, all your unit tests should pass; refer to the image below for a reference. If there are tests that are failing, look at which tests in particular are failing and use that as a starting point to troubleshoot the errors in your smart contract. Recall that you should NOT be editing the code in StackUpVault.js in any capacity.