// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PhotoTransfer {
    
    struct Photo {
        address sender;       // Address of the person sending the photo
        address recipient;    // Address of the interviewer (recipient)
        string ipfsHash;      // IPFS hash of the uploaded image
        bool isEncrypted;     // Whether the file is encrypted or not
    }

    uint256 public photoCount;         // Counter for photo records
    mapping(uint256 => Photo) public photos;  // Mapping to store all photos by ID
    
    // Event to notify when a photo is sent
    event PhotoSent(uint256 photoId, address indexed sender, address indexed recipient, string ipfsHash);

    // Function to send a photo by providing the recipient's address and IPFS hash
    function sendPhoto(address _recipient, string memory _ipfsHash, bool _isEncrypted) public {
        require(_recipient != address(0), "Invalid recipient address."); // Ensure recipient is valid

        photoCount++;  // Increment the photo count
        photos[photoCount] = Photo(msg.sender, _recipient, _ipfsHash, _isEncrypted);  // Store photo details

        // Emit an event to notify about the photo transfer
        emit PhotoSent(photoCount, msg.sender, _recipient, _ipfsHash);
    }

    // Function to retrieve the IPFS hash of a specific photo
    function getPhoto(uint256 _photoId) public view returns (string memory) {
        Photo memory photo = photos[_photoId];

        // Only the recipient can view the photo
        require(msg.sender == photo.recipient, "You are not authorized to view this photo.");

        return photo.ipfsHash;
    }
}
