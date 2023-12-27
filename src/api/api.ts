interface Window {
  _BASE_URL_: string;
}

export const BASE_URL = (window as unknown as Window)._BASE_URL_ || "failed";
