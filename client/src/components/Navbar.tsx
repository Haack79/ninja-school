import { Link } from "react-router-dom";

export const Navbar = () => {
    return (
        <nav className="flex flex-row justify-between items-center p-4 border-b border-gray-200">
            <div className="flex flex-row justify-center items-center gap-2">
                <img src="/ninja.png" alt="Ninja" className="w-10 h-10" />
                <p>Ninja School!</p>
            </div>
            <div className="flex flex-row justify-center items-center gap-2 p-4 m-2">
                <Link to="/">Home</Link>
                <Link to="/missions">Missions</Link>
                <Link to="/contact">Contact</Link>
            </div>
         </nav>
  );
};