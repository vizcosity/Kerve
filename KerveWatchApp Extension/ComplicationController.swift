//
//  ComplicationController.swift
//  KerveWatchApp Extension
//
//  Created by Aaron Baw on 31/12/2020.
//

import ClockKit


class ComplicationController: NSObject, CLKComplicationDataSource {

    static let supportedFamilies: [CLKComplicationFamily] = [.modularLarge, .modularSmall, .extraLarge, .utilitarianLarge]
    
    // MARK: - Complication Configuration

    func getComplicationDescriptors(handler: @escaping ([CLKComplicationDescriptor]) -> Void) {
        
        let descriptors = [CountryStatistic.ChartType.activeCases, .newDeaths, .newlyRecovered].map {
            CLKComplicationDescriptor(identifier: $0.description, displayName: $0.description, supportedFamilies:  Self.supportedFamilies)
        }
        
        
        // Call the handler with the currently supported complication descriptors
        handler(descriptors)
    }
    
    func handleSharedComplicationDescriptors(_ complicationDescriptors: [CLKComplicationDescriptor]) {
        // Do any necessary work to support these newly shared complication descriptors
    }

    // MARK: - Timeline Configuration
    
    func getTimelineEndDate(for complication: CLKComplication, withHandler handler: @escaping (Date?) -> Void) {
        // Call the handler with the last entry date you can currently provide or nil if you can't support future timelines
        handler(nil)
    }
    
    func getPrivacyBehavior(for complication: CLKComplication, withHandler handler: @escaping (CLKComplicationPrivacyBehavior) -> Void) {
        // Call the handler with your desired behavior when the device is locked
        handler(.showOnLockScreen)
    }

    // MARK: - Timeline Population
    
    func getCurrentTimelineEntry(for complication: CLKComplication, withHandler handler: @escaping (CLKComplicationTimelineEntry?) -> Void) {
        // Call the handler with the current timeline entry
        CovidAPI.timeline(for: "Gibraltar", completionHandler: {
            let countryStatistic = CountryStatistic($0)
            guard let template = self.createTemplate(for: countryStatistic, family: complication.family, and: CountryStatistic.ChartType(rawValue: complication.identifier) ?? .activeCases) else { return handler(nil) }
            handler(.init(date: Date(), complicationTemplate: template))
        })
    }
    
    func getTimelineEntries(for complication: CLKComplication, after date: Date, limit: Int, withHandler handler: @escaping ([CLKComplicationTimelineEntry]?) -> Void) {
        // Call the handler with the timeline entries after the given date
        handler(nil)
    }

    // MARK: - Sample Templates
    
    func getLocalizableSampleTemplate(for complication: CLKComplication, withHandler handler: @escaping (CLKComplicationTemplate?) -> Void) {
        // This method will be called once per supported complication, and the results will be cached
        guard let template = createTemplate(for: .mocked, family: complication.family, and: CountryStatistic.ChartType(rawValue: complication.identifier) ?? .activeCases) else { return handler(nil) }
        handler(template)
    }

    private func createTemplate(for countryStatistic: CountryStatistic, family: CLKComplicationFamily, and chartType: CountryStatistic.ChartType) -> CLKComplicationTemplate? {
        
        let statistic: Statistic
        let complicationTemplate: CLKComplicationTemplate

        switch chartType {
        case .activeCases: statistic = countryStatistic.casesToday
        case .newDeaths: statistic = countryStatistic.deathsToday
        case .newlyRecovered: statistic = countryStatistic.recoveriesToday
        default: statistic = countryStatistic.casesToday
        }
        
        guard let indicatorImage = UIImage(systemName: statistic.delta ?? 0 > 0 ? "arrowtriangle.up.fill" : "arrowtriangle.down.fill") else { return nil }
        
        let indicatorImageProvider = CLKImageProvider(onePieceImage: indicatorImage)
        indicatorImageProvider.tintColor = statistic.positiveChange ? .green : .red
        let headerTextProvider = CLKSimpleTextProvider(text: "GI Cases")
        headerTextProvider.tintColor = statistic.positiveChange ? .green : .red
        let statisticValueTextProvider = CLKSimpleTextProvider(text: "\(statistic.valueFormattedAsString) \(chartType.description)", shortText: statistic.valueFormattedAsString)
        let statisticDeltaTextProvider = statistic.delta != nil ? CLKSimpleTextProvider(text: "\(statistic.deltaFormattedAsString) Today", shortText: statistic.deltaFormattedAsString) : nil

        statisticDeltaTextProvider?.tintColor = statistic.positiveChange ? .green : .red

        switch family {
        case .utilitarianLarge:
            complicationTemplate = CLKComplicationTemplateUtilitarianLargeFlat(textProvider: statisticValueTextProvider, imageProvider: indicatorImageProvider)
            complicationTemplate.tintColor = statistic.positiveChange ? .green : .red
        case .extraLarge:
            complicationTemplate = CLKComplicationTemplateExtraLargeStackText(line1TextProvider: headerTextProvider, line2TextProvider: statisticValueTextProvider)
            complicationTemplate.tintColor = statistic.positiveChange ? .green : .red
        case .modularLarge:
            complicationTemplate = CLKComplicationTemplateModularLargeStandardBody(headerImageProvider: indicatorImageProvider, headerTextProvider: headerTextProvider, body1TextProvider: statisticValueTextProvider, body2TextProvider: statisticDeltaTextProvider)
            complicationTemplate.tintColor = statistic.positiveChange ? .green : .red
        case .modularSmall:
            complicationTemplate = CLKComplicationTemplateModularSmallStackImage(line1ImageProvider: indicatorImageProvider, line2TextProvider: statisticValueTextProvider)
            complicationTemplate.tintColor = statistic.positiveChange ? .green : .red
        default: ()
            return nil
        }
        
        return complicationTemplate
    }
}
