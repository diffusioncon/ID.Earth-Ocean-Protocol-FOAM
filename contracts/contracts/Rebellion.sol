pragma solidity 0.5.2;

import "./IOceanDIDRegistry.sol";
import "./IOceanAgreementStoreManager.sol";

contract Rebellion {

  event Application(address indexed rebel, bytes32 pic);
  event Confirmed(address indexed rebel, address indexed budy1, address indexed budy2, bytes32 pic);

  struct Rebel {
    bytes32 img;
    uint256 confCount;
    address budy1;
    address budy2;
  }

  mapping(address => Rebel) public rebels;
  address oceanDIDRegistry;
  address oceanProvider;


  constructor(
    address _genesisBuddy1,
    bytes32 _genesisImg1,
    address _genesisBuddy2,
    bytes32 _genesisImg2,
    address _didRegistry,
    address _oceanProvider
  ) public {
    rebels[_genesisBuddy1] = Rebel(_genesisImg1, 3, _genesisBuddy1, _genesisBuddy2);
    rebels[_genesisBuddy2] = Rebel(_genesisImg2, 3, _genesisBuddy2, _genesisBuddy1);
    oceanDIDRegistry = _didRegistry;
    oceanProvider = _oceanProvider;
  }

  /**
   * @dev an applicant registers with his keycard address.
   * applicants picture is added to ocean computation market. 
   * @param _did ocean decentralized identifier
   * @param _img face of applicant
   * @param _hash hash of image
   */
  function signup(bytes32 _did, bytes32 _img, bytes32 _hash) public {
    require(rebels[msg.sender].confCount == 0, "already applied");
    rebels[msg.sender] = Rebel(_img, 1, address(0), address(0));

    IOceanDIDRegistry didRegistry = IOceanDIDRegistry(oceanDIDRegistry);
    address[] memory providers = new address[](1);
    providers[0] = oceanProvider;
    didRegistry.registerAttribute(_did, _hash, providers, _img);
    emit Application(msg.sender, _img);
  }

  modifier onlyRebel() {
    require(rebels[msg.sender].confCount == 3, "not a verified rebel");
    _;
  }

  /**
   * @dev the buddies confirm an applicant in the network
   * @param applicant is the keycard address of applicant
   */
  function confirm(address applicant) public onlyRebel {
    // todo: take a stake from budy
    require(rebels[applicant].confCount > 0, "not applied yet");
    require(rebels[applicant].confCount < 3, "already confirmed");
    if (rebels[applicant].confCount == 1) {
      rebels[applicant].budy1 = msg.sender;
      rebels[applicant].confCount = 2;
    } else if (rebels[applicant].confCount == 2) {
      require(rebels[applicant].budy1 != msg.sender, "can not verify twice");
      rebels[applicant].budy2 = msg.sender;
      rebels[applicant].confCount = 3;
      emit Confirmed(applicant, rebels[applicant].budy1, rebels[applicant].budy2, rebels[applicant].img);
    }
  }

  /**
   * @dev the buddies confirm an applicant in the network
   */
  function challengeRebel(
    address account1,
    address account2,
    bytes32 _did,
    address[] memory _conditionTypes,
    bytes32[] memory _conditionIds,
    uint[] memory _timeLocks,
    uint[] memory _timeOuts
  ) public {
    bytes32 id = keccak256(abi.encode(account1, account2));
    // create an agreement with ocean market to check 
    // identity for face similarity.
    IOceanAgreementStoreManager agreements = IOceanAgreementStoreManager(oceanDIDRegistry);
    agreements.createAgreement(
      id,
      _did,
      _conditionTypes,
      _conditionIds,
      _timeLocks,
      _timeOuts
    );
  }

  // 
  function resolveChallenge() public {
    // todo: have oracle resolve the dispute
    // either budy looses stake, or challenger
  }

}