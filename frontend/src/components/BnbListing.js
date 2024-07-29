function BnbListing({ bnb }) {
  const { name, location, num_of_rooms, cost_per_night } = bnb
  return (
    <>
      <header></header>
      <h1>{name}</h1>
    </>
  )
}

export default BnbListing
