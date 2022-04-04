
import { AuthProvider } from '../contexts/AuthContext';
import "uppload/dist/uppload.css";
import "uppload/dist/themes/light.css";

// This default export is required in a new `pages/_app.js` file.
export default function MyApp({ Component, pageProps }) {
  return (
    <AuthProvider>
      <Component {...pageProps} />
    </AuthProvider>
  );
}