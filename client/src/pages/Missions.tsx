import { useState, useEffect } from 'react';

import type { Mission } from '@/types/mission'
import { getMissions } from '@/api/missions'
import { MissionCard } from '@/components/MissionCard'

export const Missions = () => {
    const [missions, setMissions] = useState<Mission[]>([]);
    const [error, setError] = useState<string | null>(null);
    const [isLoading, setIsLoading] = useState(true);
    useEffect(() => {
        const fetchMissions = async () => {
            setIsLoading(true);
            setError(null);
            try{
                const missions = await getMissions();
                setMissions(missions);
            } catch (error) {
                setError(error instanceof Error ? error.message : 'An unknown error occurred');
                console.error(error);
            } finally {
                setIsLoading(false);
            }
        }
        fetchMissions();
    }, []);

    if (isLoading) {
        return <p>Loading missions...</p>
    }

    if (error) {
        return <p>{error}</p>
    }
    
    return (
        <div className="missions-page">
            <div className="missions-container">
                <h1>Missions</h1>
                {missions.map((mission) => (
                    <MissionCard key={mission.id} mission={mission} />
                ))}
            </div>
        </div>
    )
}
