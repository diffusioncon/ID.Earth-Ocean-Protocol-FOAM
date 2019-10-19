pragma solidity 0.5.2;

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

  constructor(
    address _genesisBuddy1,
    bytes32 _genesisImg1,
    address _genesisBuddy2,
    bytes32 _genesisImg2
  ) public {
    rebels[_genesisBuddy1] = Rebel(_genesisImg1, 3, _genesisBuddy1, _genesisBuddy2);
    rebels[_genesisBuddy2] = Rebel(_genesisImg2, 3, _genesisBuddy2, _genesisBuddy1);
  }

  function signup(bytes32 _img) public {
    require(rebels[msg.sender].confCount == 0, "already applied");
    rebels[msg.sender] = Rebel(_img, 1, address(0), address(0));
    emit Application(msg.sender, _img);
  }

  modifier onlyRebel() {
    require(rebels[msg.sender].confCount == 3, "not a verified rebel");
    _;
  }

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

  function challengeRebel(address account1, address account2) public {
    // todo: take a stake
  }

  function resolveChallenge() public {
    // todo: have oracle resolve the dispute
    // either budy looses stake, or challenger
  }

}