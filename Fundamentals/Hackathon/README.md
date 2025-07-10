# HACKATHON
## 1: Top Rated Project
### Hackathon Contract
To complete this challenge we need to write a function that will help us find the winning project of the hackathon. The winning project will be determined by the **average score** of all of its ratings.

 > The `Hackathon.sol` contract is partially setup already.

### Your Goal: Find Winner Function
1. Create an external, view function `findWinner` which returns a `Project`.
1. In this function, use the `projects` storage array to find the project that has the **highest average rating** amongst its array of `ratings`.
1. Upon finding the highest average, return the project.