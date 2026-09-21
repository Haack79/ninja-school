import type { Mission } from '@/types/mission'

type MissionCardProps = {
    mission: Mission
}

export const MissionCard = ({ mission }: MissionCardProps) => {
    return (
        <ul>
            <li>{mission.name}</li>
            <li>{mission.description}</li>
            <li>{mission.difficulty}</li>
            <li>{mission.xp_reward}</li>
            <li>{mission.gold_reward}</li>
            <li>{mission.created_at}</li>
        </ul>
    )
}
