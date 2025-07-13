# MULTI-SIGNATURE WALLET
## 1: Constructor
### Our Goal: Setup
Let's create a Multi-Sig Wallet!

When this wallet is deployed it will be configured with the owners addresses and how many signatures are required to move funds.

### State Variables
1. Declare a public `address[] owners` to store wallet owner addresses.
2. Declare a public `uint256 required` to store the required amount of confirmations needed to execute a transaction.
### Constructor
3. Define a constructor function that has two parameters: an array of owner addresses and the `uint256` required amount of confirmations.
4. Store the two arguments in their respective state variables created above.

## 2: Error Handling
### Error Handling
Great! We've setup the owners and required signatures. 

Now, what if the deployer of the contract makes a mistake during deployment? 

When developing a user friendly contract we should be validating user inputs for common sources of error. We should definitely be checking the owners and signatures to ensure situations do not occur where the funds are immediately locked. 

These situations include deploying **no owner addresses** and when the number of signatures is **zero** or **more than the number of owners**.

## Our Goal: Handle Constructor Mistakes
Let's revert the deployment transaction in the following situations:

1. No owner addresses are sent.
1. Number of required confirmations is zero.
1. Number of required confirmations is more than the total number of owner addresses.

## 3: Transaction Setup
### Transaction Struct
We've supplied the initial setup parameters to our Multi-Sig Wallet! The wallet will require the confirmation of multiple addresses to **execute** a transaction.

This means one owner will need to propose the transaction and the smart contract will need to store information about this transaction until the other owners can sign off on it! 

### Our Goal: Transactions
Define a `Transaction` struct that includes these member variables in **the following order:**

A `address` for the destination of the transaction's value.
A `uint256` value of the transaction in wei.
A `bool` named **executed*** which indicates if the transaction has been executed.

    > *Be sure to name this executed so the test cases can use this for a transaction status on later stages.

### Transaction Storage
We'll need to store the transactions while they are being confirmed by the other owners.

You have *two options* for your implementation here:

1. Create a public mapping from a `uint` id to a `Transaction`

**OR**

2. Create a public array of `Transaction`
Then, create a public `transactionCount` view function which returns the total number of transactions stored.

    > This function can either be a getter for a public state variable or a function that returns the array length.

## 4: Add Transactions
### Transactions
You built out the storage for the transactions. 

Now it's time we create a function to put our transactions into that storage!

### Our Goal: Add Transactions
1. Define a public `addTransaction` function with a destination `address` and a value `uint256` as parameters.
1. This function should create a new transaction struct and add it to the `transactions` storage variable
1. This function should return a `uint256` transaction id to reference this particular transaction (see note below).
1. Set the `executed` boolean should be set to `false` by default.

### Note on Transaction IDs
The transaction IDs should be zero-based. The first one being `0`, then `1`, `2`, and so on.

Adding Transactions

In the first `addTransaction`, the transaction #0 is added and the `transactionCount` becomes `1`.

In the next `addTransaction`, the transaction #1 is added and the `transactionCount` becomes `2`.


## 5: Confirmations
### Confirmations Storage 
Since each transaction is only executed *after* all confirmations are received, we will need to implement a way to check which `owners` have confirmed a transaction!

Let's create the storage variable for the confirmations before diving into the functionality.

### Our Goal: Nested Confirmations Mapping
Define a public `confirmations` mapping which maps the transaction id (`uint`) to an owner (`address`) to whether or not they have confirmed the transaction (`bool`).

> A transaction id maps to a mapping of address to booleans.

The first transaction (#0) maps to two addresses, one of which has confirmed the transaction. The second transaction (#1) maps to two addresses where both have confirmed the transaction.

## 6: Confirm Transaction
### Owner Confirmations
Each owner should be able to signal their approval for the transaction by confirming it. Let's create a way for them to do this! 

### Our Goal: Confirm Transaction
Create a public `confirmTransaction` function with a transaction ID as its only argument. This function should create a confirmation for the transaction from the `msg.sender`.
### View Function
Write a public, view function called `getConfirmationsCount` that takes a `uint` called `transactionId` and returns a `uint256` representing the number of times the transaction with the given `transactionId` has been confirmed.
    > *Hint*: The only addresses that can confirm are the **owners**. This would be a good place to start when trying to count the total number of confirmations.

## 7: Confirm Security
### Only Owners
The multisig wallet would be pointless and insecure if anyone could confirm a signature. Let's make sure we handle this!

### Our Goal: Confirmation Security 
Ensure that `confirmTransaction` can only be called by the `owners` stored in the constructor. If anyone else calls this function, revert the transaction.

## 8: Submit Transaction
### Submit Transactions
Let's create a new function that will allow a user to create a transaction `and immediately confirm it`.

    > We can pretty much assume that the owner submitting the transaction also wants to confirm it. We can save them some gas of creating another transaction by confirming it immediately!

### Our Goal: Submit Transactions
1. Create an external `submitTransaction` function with a destination address and a uint value as it's arguments.
2. This function should create a new transaction and add it to storage and **confirm it**. Fortunately we already have two functions that do these things:
- The `addTransaction` function creates transactions and adds them to storage.
- The `confirmTransaction` function confirms transactions by their id.
 Invoke both of these functions from within the `submitTransaction` function.

### Change Visibility

3. Now that we have this more efficient function, change `addTransaction` function visibility from `public` to `internal`.

    > Owners will only call `submitTransaction` so `addTransaction` should not be available from outside of the contract. It's generally a good security practice to keep as few functions public/external as possible. This way you have less endpoints you need to consider for vulnerabilities!


## 9: Receive
### Receive
A multi-sig can be used as a primary wallet for an organization. This organization will have all of its funds pooled and then vote on where to spend those funds.

They may direct all payments from external users/organizations to their multi-sig address. As such, it's important that the multi-sig can always receive funds! 

### Our Goal: Payable Receive
1. Define a external, payable receive function that allows our Multi-Sig wallet to accept funds at

## 10: Is Confirmed?
### Check if Confirmed
Let's create a function that will help us determine if a transaction is confirmed or not!

We'll be able to use this as a quick lookup when executing the transaction. If the transaction is not confirmed, it should not be executed! 

### Our Goal: Confirmed Getter
1. Create a public view `isConfirmed` function with a `uint` transaction ID as it's only argument.
1. This function should return `true` if the transaction is confirmed and `false` if it is not.
    > You have written a helper function that may help you out here!


## 11: Execute
### Execution
It's time to execute our multi-sig transaction!

This is the part of the process where we have reached the required amount of signatures, so we can go ahead and move the funds! 

### Our Goal: Execute Transaction
1. Define a public `executeTransaction` function with a `uint` transaction ID as it's only argument.
1. Ensure that the `executeTransaction` function sends the transaction value to the `address` specified within the transaction object. Check out the details tab for a reminder on using the `call` syntax.
1. Once transferred, set the transaction's `executed` boolean to `true`. This way we'll know the transaction has been completed.
### Only Confirmed
4. The transaction should only execute if it is confirmed. If not, revert the transaction.


## 12: Execute Confirmed
### Immediate Execution
Currently someone must call `executeTransaction` in order for the transaction to be executed. Once the transaction has reached it's necessary number of signatures, we should immediately execute the transaction!

There's no sense in requiring the owner to make a separate call to the `executeTransaction` function after they confirmed the transaction and it has enough signatures.

### Our Goal: Execute Confirmed
1. Let's invoke `executeTransaction` within confirmTransaction! Once the multi-sig has been confirmed by enough owners to meet the requirement, invoke the execution.


## 13: Sending Calldata
### Storing ERC20 Tokens
So at this point, the question may occur to you: What if we wanted to store ERC20 tokens?

It turns out, it's quite simple to add this flexibility. All we need to do is add the ability to send calldata as part of our multisig execution.

    > This functionality will actually allow us to run more complex logic than just transferring ERC20 tokens! The ERC20 standard simply serves as a good example here.

### Our Goal: Send Calldata
1. Let's first start by adding a `bytes data` variable as the last member of our `Transaction` struct. This will store the calldata we will send to the destination!

**Compiler Complaints**

2. After you have added `bytes data` to the struct, you'll get a few compiler complaints. To fix this, you'll need to accept a `bytes` argument in `submitTransaction`, as well as `addTransaction`.
    > You'll also need to pass this through the invocation to `addTransaction` within the `submitTransaction` function!

 **Send the Data**
Finally, we'll need to send the data inside the `executeTransaction` function. We can use this syntax:

    > _tx.destination.call{ value: _tx.value }(_tx.data);

The `_tx` is the transaction we are executing. The properties `destination`, `value` and `data` could be named differently in your implementation. They are the properties stored in the `Transaction` struct for the address destination, uint value and bytecode data.