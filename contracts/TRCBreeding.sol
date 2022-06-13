pragma solidity ^0.8.0;

import "@openzeppelin/contracts/access/Ownable.sol";
import "openzeppelin-solidity/contracts/token/ERC721/ERC721.sol";

/**
 * @title racersBreeding
 * @dev racers Basic Implementation to breed them and provides basic functions.
 */  

     // Do we want different varieties of racers to be able to breed? Ex: Bronze + Plat? And what should the outcome be?
     // Is breeding something that takes place in game, through direct contract interaction or both?
contract racersBreeding is Ownable {

  using SafeMath for uint256;
  event racersBirth(uint racersNumber, uint momNumber, string racersType, string racersSex);

    // This should use an offchain oracle for true randomness
  uint racersDigits = 10;
  uint racersModulus = 10 ** racersDigits;

  struct racers {
    uint racersNum;
    uint racersMom;
    uint birthDate;
    uint races;
    string types;
    string sex;
  }

  racers[] public Racer;
  // Mapping from racers ID to owner
  mapping (uint => address) public racersToOwner;

  // Mapping from owner to number of owned racers
  mapping (address => uint) ownerracersCount;

  // Mapping from token ID to number of racerss
  mapping (uint => uint) idToracersNum;

  // Mapping from number of racerss to token ID
  mapping (uint => uint) racersNumToId;

  modifier onlyOwnerOf(address _ownerOf) {
    require(msg.sender == _ownerOf);
    _;
  }

  /**
   * @dev Internal function to give birth of a racers with variables
   * @param _racersNum new racers identity number
   * @param _racersMom new racers's mother identity number
   * @param _types new racers's type such as BrownSwiss
   * @param _sex new racers's sex male or female
   */
  function _racersBirth(uint _racersNum, uint _racersMom, string _types, string _sex) internal {
    uint id = racerss.push(racers(_racersNum, _racersMom, block.timestamp, _types, _sex)) - 1;
    idToracersNum[id] = _racersNum;
    racersNumToId[_racersNum] = id;
    racersToOwner[_racersNum] = msg.sender;
    ownerracersCount[msg.sender] = ownerracersCount[msg.sender].add(1);
    emit racersBirth(_racersNum, _racersMom, _types, _sex);
  }

  /**
   * @dev Gives birth of a racers with variables
   * @param _racersMom new racers's mother identity number
   * @param _types new racers's type such as BrownSwiss
   * @param _sex new racers's sex male or female
   */
  function racersBirth(uint _racersMom, string _types, string _sex) public {
    // Generate a unique identifier for racerss
    uint _racersNum = uint(keccak256(abi.encodePacked(msg.sender, blockhash(block.number - 1)))) % racersModulus;
    _racersBirth(_racersNum, _racersMom, _types, _sex);
  }

  /**
   * @dev Gets racerss in struct from the owner address
   * @param _owner racers owner address
   * @return uint array of racers structs
   */
  function getracerssByOwner(address _owner) external view returns (uint[]) {
    uint[] memory racerssByOwner = new uint[](ownerracersCount[_owner]);
    uint counter = 0;
    uint number;
    for (uint i = 0; i < racerss.length; i++) {
      number = idToracersNum[i];
      if (racersToOwner[number] == _owner) {
        racerssByOwner[counter] = number;
        counter = counter.add(1);
      }
    }
    return racerssByOwner;
  }

  /**
   * @dev Gets racers counts from the owner address
   * @param _owner racers owner address
   * @return uint of racers counts of the owner
   */
  function getCountByOwner(address _owner) external view returns (uint) {
    return ownerracersCount[_owner]; 
  }

  /**
   * @dev Gets number of racerss from the racers id
   * @param _racersNum racers identity number
   * @return uint of racers id
   */
  function getIdByracersNum(uint _racersNum) external view returns (uint) {
    return racersNumToId[_racersNum];
  }
 
  /**
   * @dev Gets an owner address from a racers identity number
   * @param _racerNum racer identity number
   * @return address of the owner of the mentioned identity number
   */
  function getOwnerByRacer(uint _racerNum) public view returns (address) {
    return reacerToOwner[_reacerNum];
  } 
}