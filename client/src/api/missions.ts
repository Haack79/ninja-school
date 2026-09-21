import type { Mission } from "@/types/mission";

export const getMissions = async (): Promise<Mission[]> => {
    const response = await fetch("http://127.0.0.1:8000/api/missions");
    if (!response.ok) {
        throw new Error("Failed to fetch missions");
    }
    return response.json();
}
