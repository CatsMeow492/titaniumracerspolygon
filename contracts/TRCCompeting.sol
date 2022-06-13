pragma solidity 0.8.1;

import "@openzeppelin/contracts/access/Ownable.sol";

contract TRCCompeting is Ownable {
      using SafeMath for uint256;
      uint competitions;
      competitions[] public Competition;

      event compete(address recerOne, racerTwo);

      function win(address _addressWinner) {
          _addressWinner = racerOne
          _addressWinner.competitions += 1;

      }

}