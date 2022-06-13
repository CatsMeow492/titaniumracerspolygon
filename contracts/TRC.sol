// Do you want me to deploy and transfer ownership or deploy yourself?
// SPDX-License-Identifier: MIT
pragma solidity 0.8.1;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/utils/Counters.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";

contract TitaniumRacers is ERC721URIStorage, Ownable {
    using Counters for Counters.Counter;
    Counters.Counter private _tokenIds;
    bool isAdult = false;

    constructor() ERC721("TitaniumRacersTest", "TRC") {}
    // Checks if the racer is an adult
    modifier onlyAdult {
        require(isAdult == true);
        _;
    }
    // Checks if the racers ia a child
    modifier onlyChild {
        require(isAdult == false);
        _;
    }
    // Sets adult status
    function setAdult(bool _isAdult) internal onlyChild {
        _isAdult = true;
        isAdult = _isAdult;
    }

    function mintNFT(address recipient, string memory tokenURI)
        public onlyOwner
        returns (uint256)
    {
        _tokenIds.increment();

        uint256 newItemId = _tokenIds.current();
        _mint(recipient, newItemId);
        _setTokenURI(newItemId, tokenURI);

        return newItemId;
    }
}