# EduToken.sol

- EduToken smart contract is an implementation that combines the functionalities of ERC1155 and OpenZeppelin's AccessControl (a role-based access control system). This contract is designed to simulate an educational reward system where teachers can award credits to students, and students can then redeem those credits for rewards.

### Here’s some information about the smart contract we’ll be creating:

- We’ll be creating an ERC1155 smart contract called EduToken, this smart contract will be used to facilitate simple student-teacher interactions
- Teachers have the ability to award credits (fungible tokens) to Students based on their performance in school
- Students will be able to use their accumulated credits to redeem for perk cards (non-fungible tokens). These perk cards contain a variety of one-time benefits that students can enjoy - some examples include a skip-assignment pass, skip-school-for-a-day pass, etc.