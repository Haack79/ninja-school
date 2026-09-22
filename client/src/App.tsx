import { Routes, Route } from "react-router-dom";

import { Missions } from "@/pages/Missions";

function App() {
    return (
        <Routes>
            <Route path="/missions" element={<Missions />} />
        </Routes>
    );
}

export default App;