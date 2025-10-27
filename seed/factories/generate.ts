type FactoryOptions<T> = Partial<T>

export const generateFactory = <T>(generator: () => T) => {
  return (options?: FactoryOptions<T>): T => {
    const generated = generator()
    return { ...generated, ...options }
  }
}
