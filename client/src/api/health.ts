export async function getHealth() {
  const response = await fetch("http://localhost:8000/api/health");
  if (!response.ok) {
    throw new Error("Ninja school not reachable");
  }
  return response.json();
}