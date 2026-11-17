import { Routes, Route } from "react-router-dom";

import { Missions } from "@/pages/Missions";
import { Home } from "@/pages/Home";
import { Layout } from "@/layouts/Layout";

function App() {
    return (
        <Routes>
            <Route element={<Layout />}>
                <Route index element={<Home />} />
                <Route path="missions" element={<Missions />} />
            </Route>
        </Routes>
    );
}

export default App;