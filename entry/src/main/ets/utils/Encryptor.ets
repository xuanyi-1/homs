import CryptoJS from '@ohos/crypto-js';

const SECRET_KEY: string = 'j3klJ9Dm18pKjkA6'; // 用于加密和解密的密钥

export const encryptText = (text: string): string => {
  const encrypted: string = CryptoJS.AES.encrypt(
    text,
    CryptoJS.enc.Utf8.parse(SECRET_KEY),
    {
      mode: CryptoJS.mode.ECB,
      padding: CryptoJS.pad.Pkcs7,
    }
  ).toString();

  return encrypted;
};