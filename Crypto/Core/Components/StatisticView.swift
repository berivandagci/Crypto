import SwiftUI

struct StatisticView: View {
    let stat: StatisticModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(stat.title)
                .font(.caption)
                .foregroundColor(.secondary)
            
            Text(stat.value)
                .font(.headline)
                .foregroundColor(.primary)
            
            if let percentageChange = stat.percentageChange {
                HStack(spacing: 4) {
                    Image(systemName: "triangle.fill")
                        .font(.caption2)
                    
                    Text(percentageChange.asPercentString())
                        .font(.caption)
                        .bold()
                }
                .foregroundColor(percentageChange >= 0 ? .green : .red)
            }
        }
    }
}

#Preview {
    Group {
        StatisticView(stat: dev.state1)
        StatisticView(stat: dev.state2)
    }
}
