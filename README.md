

# PhotoTransfer - Secure Photo Transfer via Blockchain

This is a smart contract for **secure photo transfer** on the Ethereum blockchain using IPFS for storage. It enables users to send photos securely to a specific recipient, ensuring that only the designated recipient can view the photo. The contract leverages the decentralized nature of IPFS to store image files and facilitates transfer tracking on-chain.

## Features
- **Photo Transfer**: Send photos to a specified recipient via their Ethereum address.
- **IPFS Integration**: Photos are stored on **IPFS**, and only the IPFS hash is recorded on-chain.
- **Security**: Only the recipient of a photo can retrieve and view the associated IPFS hash.
- **Encryption Option**: Senders can mark photos as encrypted for additional privacy.


## How It Works
1. **Send a Photo**: Users can send a photo by calling the `sendPhoto` function, providing the recipient's Ethereum address, the IPFS hash of the image, and an optional flag indicating whether the photo is encrypted.
2. **View a Photo**: Only the designated recipient can retrieve the photo's IPFS hash by calling the `getPhoto` function. The contract ensures that no unauthorized party can access the IPFS hash.


### Prerequisites
- **Node.js**: Ensure you have Node.js installed.
- **MetaMask**: A Web3 wallet to interact with the contract.
- **IPFS**: You'll need to upload photos to IPFS manually or using a service like **Infura** or **Pinata**.


### Usage

1. **Send Photo**:
   - Call the `sendPhoto` function with the recipient's address, the IPFS hash of the photo, and a boolean indicating whether the file is encrypted.

2. **View Photo**:
   - The recipient can call `getPhoto` with the photo's ID to retrieve the IPFS hash.


## License
This project is licensed under the **MIT License**.
