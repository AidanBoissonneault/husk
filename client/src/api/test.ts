export const fetchTest = async () => {
	const res = await fetch('/api/test')
	const data = await res.json()
	console.log(data)
	return data
}
