pragma solidity 0.4.21;


contract ArtTradeBasic {

  event Transfer(address indexed _from, address indexed _to, uint256 _objectId);
  
  // Association des objets vers leurs propriétaires
  mapping (uint256 => address) internal objectOwner;

  // Renvoie le propriétaire d'un objet donné
  function ownerOf(uint256 _objectId) public view returns (address) {
    address owner = objectOwner[_objectId];
    return owner;
  }

  // Transfert la propriété d'un objet
  function transferObject( address _to, uint256 _objectId) public {
    
    // Vérifie que l'on est bien en présence du propriétaire
    require(ownerOf(_objectId) == msg.sender);

    // Changer la propriété de l'objet
    objectOwner[_objectId] = _to;

    emit Transfer(msg.sender, _to, _objectId);
  }

}
