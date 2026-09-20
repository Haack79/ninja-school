import { useEffect, useState } from "react";
import { getHealth } from "./api/health";

function App() {
  const [message, setMessage] = useState("Checking the dojo...");

  useEffect(() => {
    async function checkHealth() {
      try {
        const data = await getHealth();
        setMessage(data.message);
      } catch (error) {
        console.error(error);
        setMessage("The dojo appears to be under attack.");
      }
    }

    checkHealth();
  }, []);

  return (
    <main>
      <h1>🥷 Ninja School</h1>
      <p>{message}</p>
    </main>
  );
}

export default App;