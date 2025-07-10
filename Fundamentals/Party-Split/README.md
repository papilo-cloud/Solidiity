# Party Split

## 1: RSVP
###  Your Goal: Start a Party!
This challenge is all about creating a group with your friends to split a shared expense.

### Setup
1. The first thing you'll need to do is create a constructor function on the Party contract which will set the deposit amount it will cost someone to RSVP to the party. This constructor function will take in a uint256 amount. Store this for later. It must be paid by the participants, or they cannot join the party!
### RSVP
2. Create a external, payable function called rsvp that will allow your friends to join the party. This function should keep track of the addresses joining the party so we can split the expenses in the next stage. These will be the addresses calling the function.
### Security
3. Ensure that anyone who RSVPs to the party sends the exactly the required deposit. If they do not send exactly this amount, revert the transaction.
4. Ensure that an address that has RSVP'd already cannot RSVP again! If the same address tries to RSVP twice, revert the transaction.

## 2: Pay Bill
### Pay the Bill
Once the party's over, it's time to pay the shared expenses! Be sure to distribute the remainder to the members of the party 

### Your Goal: Share Expenses
1. Create an external function called `payBill` which takes an `address` for the venue and an `uint` amount for the total cost of the bill.
1. Use the pooled funds in the contract to pay this bill amount to the venue address (you can assume the pooled funds from the deposit are enough to pay the bill).
1. In the `payBill` function, evenly distribute the remaining funds among the members of the party.