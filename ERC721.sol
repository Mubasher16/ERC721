// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
contract myNft is ERC721 , Ownable{
    uint256 private maxSupply;
    uint256 private tokenId =0;
    constructor() ERC721("CryptoCats","Cat"){

    }
    function mintOneNft(address _address) public onlyOwner{
    require(_address != address(0),"Sorry: We can't mint NFTs");
    require(tokenId<=maxSupply, "Max limit reached");
    _mint(_address,tokenId);
    tokenId++;
    }
      function mintMoreNft(address _address, uint256 tokensMinted) public onlyOwner{
    require(_address != address(0),"Sorry: We can't mint NFTs");
    require(tokenId+tokensMinted<=maxSupply, "Max limit reached");
    for(uint8 a=1; a<=tokensMinted;a++){
    _mint(_address,tokenId);
    tokenId++;}
    }

        // set max supply of tokens
     function setMaxSupply(uint256 _supply) public onlyOwner{
      maxSupply = _supply;
    }
    function getMaxsupply() public view returns (uint256){
        return maxSupply;
    }
}